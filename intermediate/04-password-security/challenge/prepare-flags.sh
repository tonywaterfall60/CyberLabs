#!/usr/bin/env bash
set -euo pipefail

AUDIT_FLAG="${INTERMEDIATE_PASSWORD_AUDIT_FLAG:-FLAG_NOT_CONFIGURED}"
CONTROL_FLAG="${INTERMEDIATE_PASSWORD_CONTROLS_FLAG:-FLAG_NOT_CONFIGURED}"

rm -rf runtime
mkdir -p runtime
printf 'audit_flag=%s\n' "$AUDIT_FLAG" > runtime/audit-note.txt
printf 'control_flag=%s\n' "$CONTROL_FLAG" > runtime/control-review.txt

echo "[+] Intermediate 04 runtime artifacts prepared."
