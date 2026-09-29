#!/usr/bin/env bash
set -euo pipefail

STATIC_FLAG="${INTERMEDIATE_RE_STATIC_FLAG:-FLAG_NOT_CONFIGURED}"
DYNAMIC_FLAG="${INTERMEDIATE_RE_DYNAMIC_FLAG:-FLAG_NOT_CONFIGURED}"

rm -rf runtime
mkdir -p runtime
printf 'static_flag=%s\n' "$STATIC_FLAG" > runtime/static-note.txt
printf '%s\n' "$DYNAMIC_FLAG" > runtime/dynamic-flag.txt

echo "[+] Intermediate 11 runtime artifacts prepared."
