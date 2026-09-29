#!/usr/bin/env bash
set -euo pipefail

TIMELINE_FLAG="${INTERMEDIATE_PACKET_TIMELINE_FLAG:-FLAG_NOT_CONFIGURED}"
LIMITS_FLAG="${INTERMEDIATE_PACKET_LIMITS_FLAG:-FLAG_NOT_CONFIGURED}"

rm -rf runtime
mkdir -p runtime
printf 'timeline_flag=%s\n' "$TIMELINE_FLAG" > runtime/timeline.txt
printf 'limits_flag=%s\n' "$LIMITS_FLAG" > runtime/limitations.txt

echo "[+] Intermediate 07 runtime packet artifacts prepared."
