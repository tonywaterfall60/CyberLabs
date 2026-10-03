#!/usr/bin/env bash
set -euo pipefail
BASE="$HOME/cyberclub/extra-beginner-b07"
rm -rf "$BASE"
mkdir -p "$BASE"
printf '%s' "${BEGINNER_EXTRA_B07_FLAG:-FLAG_NOT_CONFIGURED}" | base64 > "$BASE/message.b64"
printf 'CyberLabs integrity practice\n' > "$BASE/evidence.txt"
(cd "$BASE" && sha256sum evidence.txt > evidence.sha256)
echo "[+] B07 crypto practice files created at $BASE"
