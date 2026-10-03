#!/usr/bin/env bash
set -euo pipefail

WEB_FLAG="${ADV_WEB_FLAG:-FLAG_NOT_CONFIGURED}"
TELEMETRY_FLAG="${ADV_WEB_TELEMETRY_FLAG:-FLAG_NOT_CONFIGURED}"

rm -rf runtime
mkdir -p runtime
printf 'WEB_FLAG_VALUE=%q\n' "$WEB_FLAG" > runtime/web.env
printf 'telemetry_flag=%s\n' "$TELEMETRY_FLAG" > runtime/telemetry-note.txt

echo "[+] Advanced 01 runtime artifacts prepared."
