#!/usr/bin/env bash
set -euo pipefail
BASE="$HOME/cyberclub/extra-beginner-b08"
rm -rf "$BASE"
mkdir -p "$BASE"
cat > "$BASE/mystery.dat" <<EOF
CyberLabs Training Artifact
case=BF08
owner=training
flag=${BEGINNER_EXTRA_B08_FLAG:-FLAG_NOT_CONFIGURED}
EOF
touch -t 202610011230 "$BASE/mystery.dat"
echo "[+] B08 evidence created at $BASE"
