#!/usr/bin/env bash
set -euo pipefail

TIMELINE_FLAG="${ADV_NETWORK_TIMELINE_FLAG:-FLAG_NOT_CONFIGURED}"
HYPOTHESIS_FLAG="${ADV_NETWORK_HYPOTHESIS_FLAG:-FLAG_NOT_CONFIGURED}"

rm -rf runtime
mkdir -p runtime
printf 'timeline_flag=%s\n' "$TIMELINE_FLAG" > runtime/timeline-note.txt
printf 'hypothesis_flag=%s\n' "$HYPOTHESIS_FLAG" > runtime/hypothesis-note.txt

echo "[+] Advanced 05 runtime artifacts prepared."
