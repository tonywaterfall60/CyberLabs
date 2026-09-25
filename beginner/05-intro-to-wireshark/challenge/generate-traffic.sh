#!/usr/bin/env bash
set -euo pipefail
BASE='http://127.0.0.1:8085'

for path in / /status /help /status; do
  echo "[+] GET $path"
  curl -s -o /dev/null -w '    HTTP %{http_code}\n' "$BASE$path"
  sleep 1
done

echo '[+] Traffic generation complete.'