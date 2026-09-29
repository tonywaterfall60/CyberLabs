#!/usr/bin/env bash
set -euo pipefail
norm(){ printf '%s' "$1" | tr '[:upper:]' '[:lower:]' | xargs; }
ask(){ local p="$1" e="$2" a; read -r -p "$p " a; [[ "$(norm "$a")" == "$(norm "$e")" ]] || { echo "[-] Review the incident-response concepts and try again."; exit 1; }; }

ask "Limiting ongoing impact is containment or eradication?" "containment"
ask "Removing the root cause is containment or eradication?" "eradication"
ask "Should evidence generally be preserved before destructive cleanup? (yes/no)" "yes"
ask "Returning systems safely to service is which phase?" "recovery"

FLAG="${BEGINNER_IR_RESPONSE_FLAG:-}"
[[ -n "$FLAG" ]] || { echo "[!] Response reasoning correct, but BEGINNER_IR_RESPONSE_FLAG is not configured."; exit 2; }
echo "[+] Incident-response workflow checkpoint passed."
echo "$FLAG"
