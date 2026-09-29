#!/usr/bin/env bash
set -euo pipefail
norm(){ printf '%s' "$1" | tr '[:upper:]' '[:lower:]' | xargs; }
ask(){ local p="$1" e="$2" a; read -r -p "$p " a; [[ "$(norm "$a")" == "$(norm "$e")" ]] || { echo "[-] Re-check the incident timeline and try again."; exit 1; }; }

ask "Affected user:" "morgan"
ask "Source IP:" "10.40.0.77"
ask "Exported object:" "quarterly.csv"
ask "Affected endpoint:" "WS-44"

FLAG="${BEGINNER_IR_TRIAGE_FLAG:-}"
[[ -n "$FLAG" ]] || { echo "[!] Triage correct, but BEGINNER_IR_TRIAGE_FLAG is not configured."; exit 2; }
echo "[+] Incident triage checkpoint passed."
echo "$FLAG"
