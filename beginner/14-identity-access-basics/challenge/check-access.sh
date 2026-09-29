#!/usr/bin/env bash
set -euo pipefail
norm(){ printf '%s' "$1" | tr '[:upper:]' '[:lower:]' | xargs; }
ask(){ local p="$1" e="$2" a; read -r -p "$p " a; [[ "$(norm "$a")" == "$(norm "$e")" ]] || { echo "[-] Review the identity evidence and try again."; exit 1; }; }

ask "Did alex successfully authenticate? (yes/no)" "yes"
ask "Was MFA approved? (yes/no)" "yes"
ask "Who owns report-2?" "sam"
ask "Was alex allowed to access report-2? (yes/no)" "yes"
ask "Is that final event primarily an authentication or authorization issue?" "authorization"

FLAG="${BEGINNER_IDENTITY_ACCESS_FLAG:-}"
[[ -n "$FLAG" ]] || { echo "[!] Access analysis correct, but BEGINNER_IDENTITY_ACCESS_FLAG is not configured."; exit 2; }
echo "[+] Identity and authorization checkpoint passed."
echo "$FLAG"
