#!/usr/bin/env bash
set -e

BASE="$HOME/cyberclub/cli-challenge"
rm -rf "$BASE"
mkdir -p "$BASE"

cat > "$BASE/auth.log" <<'EOF'
INFO user=alex action=LOGIN_SUCCESS source=192.168.56.10
WARNING user=sam action=FAILED_LOGIN source=192.168.56.50
WARNING user=sam action=FAILED_LOGIN source=192.168.56.50
INFO user=lee action=LOGIN_SUCCESS source=192.168.56.12
WARNING user=pat action=FAILED_LOGIN source=192.168.56.77
WARNING user=sam action=FAILED_LOGIN source=192.168.56.50
INFO user=alex action=LOGOUT source=192.168.56.10
WARNING user=pat action=FAILED_LOGIN source=192.168.56.77
INFO user=lee action=LOGOUT source=192.168.56.12
EOF

echo "[+] Challenge created at $BASE"
