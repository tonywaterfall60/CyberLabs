#!/usr/bin/env bash
set -euo pipefail
BASE="$HOME/cyberclub/extra-beginner-b05"
rm -rf "$BASE"
mkdir -p "$BASE/site"
cat > "$BASE/site/index.html" <<EOF
<h1>HTTP Practice</h1>
<p>Use curl with headers and status output.</p>
<p>flag=${BEGINNER_EXTRA_B05_FLAG:-FLAG_NOT_CONFIGURED}</p>
EOF
echo "[+] B05 files prepared at $BASE"
echo "[+] Start with: python3 -m http.server 8500 --bind 127.0.0.1 --directory $BASE/site"
