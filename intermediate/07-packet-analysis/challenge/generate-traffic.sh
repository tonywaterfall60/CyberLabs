#!/usr/bin/env bash
set -euo pipefail
BASE="http://127.0.0.1:8300"

declare -a paths=(/ /login /api/profile /api/profile /logout)
for path in "${paths[@]}"; do
  echo "[+] GET $path"
  curl -s -o /dev/null -D - -H "X-Training-Session: session-42" "$BASE$path"
  sleep 1
done
echo "[+] Local training traffic generated."