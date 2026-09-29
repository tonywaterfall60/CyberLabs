#!/usr/bin/env bash
set -euo pipefail

SCANNER_FLAG="${INTERMEDIATE_PYTHON_SCANNER_FLAG:-FLAG_NOT_CONFIGURED}"
AUTOMATION_FLAG="${INTERMEDIATE_PYTHON_AUTOMATION_FLAG:-FLAG_NOT_CONFIGURED}"

rm -rf runtime
mkdir -p runtime
printf 'scanner_flag=%s\n' "$SCANNER_FLAG" > runtime/scanner-complete.txt
printf 'automation_flag=%s\n' "$AUTOMATION_FLAG" > runtime/automation-note.txt

echo "[+] Intermediate 10 runtime artifacts prepared."
