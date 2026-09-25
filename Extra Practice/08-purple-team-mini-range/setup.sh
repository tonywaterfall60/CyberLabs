#!/usr/bin/env bash
set -euo pipefail

BASE="$(cd "$(dirname "$0")" && pwd)"
cd "$BASE"

mkdir -p runtime
rm -f runtime/*.jsonl runtime/*.log
chmod 777 runtime

docker compose up --build -d

echo "[+] Purple-Team Mini Range started."
echo "[+] Target: http://127.0.0.1:8760"
echo "[+] Logs:   $BASE/runtime"
echo "[+] Stop with: ./reset.sh"