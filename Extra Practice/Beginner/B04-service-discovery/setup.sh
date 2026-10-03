#!/usr/bin/env bash
set -euo pipefail
BASE="$HOME/cyberclub/extra-beginner-b04"
rm -rf "$BASE"
mkdir -p "$BASE/site"
printf '<h1>CyberLabs Beginner Service</h1>\n<p>flag=%s</p>\n' "${BEGINNER_EXTRA_B04_FLAG:-FLAG_NOT_CONFIGURED}" > "$BASE/site/index.html"
echo "[+] B04 files prepared at $BASE"
echo "[+] Start the service with: python3 -m http.server 8400 --bind 127.0.0.1 --directory $BASE/site"
