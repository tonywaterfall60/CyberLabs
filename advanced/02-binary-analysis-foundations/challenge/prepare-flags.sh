#!/usr/bin/env bash
set -euo pipefail

CRASH_FLAG="${ADV_BINARY_CRASH_FLAG:-FLAG_NOT_CONFIGURED}"
MITIGATION_FLAG="${ADV_BINARY_MITIGATION_FLAG:-FLAG_NOT_CONFIGURED}"

rm -rf runtime
mkdir -p runtime
printf 'crash_flag=%s\n' "$CRASH_FLAG" > runtime/crash-note.txt
printf 'mitigation_flag=%s\n' "$MITIGATION_FLAG" > runtime/mitigation-note.txt

echo "[+] Advanced 02 runtime artifacts prepared."
