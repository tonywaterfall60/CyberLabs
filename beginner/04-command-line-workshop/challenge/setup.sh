#!/usr/bin/env bash
set -euo pipefail

BASE="$HOME/cyberclub/cli-challenge"
rm -rf "$BASE"
mkdir -p "$BASE"

cat > "$BASE/auth.log" <<'EOF'
2026-09-24T10:00:01Z INFO user=alex action=LOGIN_SUCCESS source=192.168.56.10
2026-09-24T10:00:04Z WARNING user=sam action=FAILED_LOGIN source=192.168.56.50
2026-09-24T10:00:08Z WARNING user=sam action=FAILED_LOGIN source=192.168.56.50
2026-09-24T10:00:12Z INFO user=lee action=LOGIN_SUCCESS source=192.168.56.12
2026-09-24T10:00:18Z WARNING user=pat action=FAILED_LOGIN source=192.168.56.77
2026-09-24T10:00:22Z WARNING user=sam action=FAILED_LOGIN source=192.168.56.50
2026-09-24T10:00:30Z INFO user=alex action=LOGOUT source=192.168.56.10
2026-09-24T10:00:35Z WARNING user=pat action=FAILED_LOGIN source=192.168.56.77
2026-09-24T10:00:40Z INFO user=lee action=LOGOUT source=192.168.56.12
2026-09-24T10:00:45Z WARNING user=sam action=FAILED_LOGIN source=192.168.56.50
2026-09-24T10:00:55Z INFO user=alex action=LOGIN_SUCCESS source=192.168.56.10
EOF

cat > "$BASE/hosts.csv" <<'EOF'
web01,192.168.56.20,80
ssh01,192.168.56.21,22
dns01,192.168.56.22,53
api01,192.168.56.23,8080
EOF

echo "[+] Challenge created at $BASE"
echo "[+] Files: auth.log hosts.csv"