#!/usr/bin/env bash
set -euo pipefail
EVIDENCE="$(dirname "$0")/evidence.txt"
[[ -f "$EVIDENCE" ]] || { echo "[-] evidence.txt not found."; exit 1; }

for event in login_failure login_success mfa_challenge mfa_approved object_access; do
  grep -q "\"event\":\"$event\"" "$EVIDENCE" || { echo "[-] Missing expected event: $event"; exit 1; }
done

FLAG="${BEGINNER_IDENTITY_TIMELINE_FLAG:-}"
[[ -n "$FLAG" ]] || { echo "[!] Timeline validated, but BEGINNER_IDENTITY_TIMELINE_FLAG is not configured."; exit 2; }
echo "[+] Identity timeline checkpoint passed."
echo "$FLAG"
