#!/usr/bin/env bash
set -euo pipefail

DISCOVERY_FLAG="${INTERMEDIATE_NET_DISCOVERY_FLAG:-FLAG_NOT_CONFIGURED}"
PRIORITY_FLAG="${INTERMEDIATE_NET_PRIORITY_FLAG:-FLAG_NOT_CONFIGURED}"

rm -rf runtime
mkdir -p runtime
printf 'discovery_flag=%s\n' "$DISCOVERY_FLAG" > runtime/discovery.txt
printf 'priority_flag=%s\n' "$PRIORITY_FLAG" > runtime/priority.txt

echo "[+] Intermediate 01 runtime artifacts prepared."
