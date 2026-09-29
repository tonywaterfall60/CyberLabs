#!/usr/bin/env bash
set -euo pipefail

MAP_FLAG="${INTERMEDIATE_WEB_MAP_FLAG:-FLAG_NOT_CONFIGURED}"
TRUST_FLAG="${INTERMEDIATE_WEB_TRUST_FLAG:-FLAG_NOT_CONFIGURED}"

rm -rf runtime
mkdir -p runtime
printf 'map_flag=%s\n' "$MAP_FLAG" > runtime/map.txt
printf 'trust_flag=%s\n' "$TRUST_FLAG" > runtime/trust.txt

echo "[+] Intermediate 02 runtime artifacts prepared."
