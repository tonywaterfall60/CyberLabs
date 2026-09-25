#!/usr/bin/env bash
set -euo pipefail
BASE="$(cd "$(dirname "$0")" && pwd)"
cd "$BASE"

mkdir -p runtime
rm -f runtime/*.jsonl
chmod 777 runtime

docker compose up --build -d

echo "[+] Multi-host range started."
echo "[+] Scope: 172.28.14.0/28"
echo "[+] Logs:  $BASE/runtime"
echo "[+] Give the activity generator a few seconds before reviewing telemetry."