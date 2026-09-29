#!/usr/bin/env bash
set -euo pipefail

PARSER_FLAG="${INTERMEDIATE_PYTHON_PARSER_FLAG:-FLAG_NOT_CONFIGURED}"
AUTOMATION_FLAG="${INTERMEDIATE_PYTHON_AUTOMATION_FLAG:-FLAG_NOT_CONFIGURED}"

rm -rf runtime
mkdir -p runtime
printf 'parser_flag=%s\n' "$PARSER_FLAG" > runtime/parser-complete.txt
printf 'automation_flag=%s\n' "$AUTOMATION_FLAG" > runtime/automation-note.txt

echo "[+] Intermediate 10 runtime artifacts prepared."
