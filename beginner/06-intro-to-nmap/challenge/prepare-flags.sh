#!/usr/bin/env bash
set -euo pipefail

DISCOVERY_FLAG="${BEGINNER_NMAP_DISCOVERY_FLAG:-FLAG_NOT_CONFIGURED}"
VALIDATION_FLAG="${BEGINNER_NMAP_VALIDATION_FLAG:-FLAG_NOT_CONFIGURED}"

rm -rf runtime
mkdir -p runtime
printf 'discovery_flag=%s\n' "$DISCOVERY_FLAG" > runtime/discovery.txt
printf 'validation_flag=%s\n' "$VALIDATION_FLAG" > runtime/validation.txt

echo "[+] Runtime service-enumeration artifacts prepared."
