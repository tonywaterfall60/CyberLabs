#!/usr/bin/env bash
set -euo pipefail
BASE="$HOME/cyberclub/extra-beginner-b03"
rm -rf "$BASE"
mkdir -p "$BASE"
cat > "$BASE/network-notes.txt" <<EOF
host=training-web
ip=127.0.0.1
protocol=tcp
port=8080
dns_name=training.local
transport_question=Which protocol provides reliable ordered delivery?
flag=${BEGINNER_EXTRA_B03_FLAG:-FLAG_NOT_CONFIGURED}
EOF
echo "[+] B03 workspace created at $BASE"
