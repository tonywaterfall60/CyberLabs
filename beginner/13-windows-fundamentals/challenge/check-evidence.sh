#!/usr/bin/env bash
set -euo pipefail
EVIDENCE="$(dirname "$0")/evidence.txt"
[[ -f "$EVIDENCE" ]] || { echo "[-] evidence.txt not found."; exit 1; }

grep -q 'PID=4220 Image=powershell.exe Parent=WINWORD.EXE' "$EVIDENCE" || { echo "[-] Expected process evidence not found."; exit 1; }
grep -q 'CyberBackup Running LocalSystem' "$EVIDENCE" || { echo "[-] Expected service evidence not found."; exit 1; }
grep -q 'InventoryCheck RunAs=SYSTEM' "$EVIDENCE" || { echo "[-] Expected scheduled task evidence not found."; exit 1; }

FLAG="${BEGINNER_WINDOWS_EVIDENCE_FLAG:-}"
[[ -n "$FLAG" ]] || { echo "[!] Evidence located, but BEGINNER_WINDOWS_EVIDENCE_FLAG is not configured."; exit 2; }
echo "[+] Windows evidence checkpoint passed."
echo "$FLAG"
