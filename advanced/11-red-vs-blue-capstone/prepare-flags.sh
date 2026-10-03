#!/usr/bin/env bash
set -euo pipefail
RED_FLAG="${ADV_REDBLUE_FLAG:-FLAG_NOT_CONFIGURED}"
BLUE_FLAG="${ADV_REDBLUE_BLUE_FLAG:-FLAG_NOT_CONFIGURED}"
PURPLE_FLAG="${ADV_REDBLUE_PURPLE_FLAG:-FLAG_NOT_CONFIGURED}"
rm -rf runtime
mkdir -p runtime
printf 'RED_FLAG_VALUE=%s\n' "$RED_FLAG" > runtime/red.env
printf 'blue_flag=%s\n' "$BLUE_FLAG" > runtime/blue-note.txt
printf 'purple_flag=%s\n' "$PURPLE_FLAG" > runtime/purple-note.txt
echo "[+] Advanced 11 runtime artifacts prepared."
