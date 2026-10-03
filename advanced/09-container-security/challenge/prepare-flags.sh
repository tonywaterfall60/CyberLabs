#!/usr/bin/env bash
set -euo pipefail
RISK_FLAG="${ADV_CONTAINER_RISK_FLAG:-FLAG_NOT_CONFIGURED}"
HARDEN_FLAG="${ADV_CONTAINER_HARDEN_FLAG:-FLAG_NOT_CONFIGURED}"
rm -rf runtime
mkdir -p runtime
printf 'risk_flag=%s\n' "$RISK_FLAG" > runtime/risk-note.txt
printf 'hardening_flag=%s\n' "$HARDEN_FLAG" > runtime/hardening-note.txt
echo "[+] Advanced 09 runtime artifacts prepared."
