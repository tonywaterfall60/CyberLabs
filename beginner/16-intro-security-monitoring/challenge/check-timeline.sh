#!/usr/bin/env bash
set -euo pipefail
norm(){ printf '%s' "$1" | tr '[:upper:]' '[:lower:]' | xargs; }
ask(){ local p="$1" e="$2" a; read -r -p "$p " a; [[ "$(norm "$a")" == "$(norm "$e")" ]] || { echo "[-] Rebuild the event timeline and try again."; exit 1; }; }

ask "User in the sequence:" "sam"
ask "Host in the sequence:" "WS-10"
ask "Process launched after login success:" "powershell.exe"
ask "Parent process:" "winword.exe"
ask "Network destination:" "198.51.100.50:443"

FLAG="${BEGINNER_MONITORING_TIMELINE_FLAG:-}"
[[ -n "$FLAG" ]] || { echo "[!] Timeline correct, but BEGINNER_MONITORING_TIMELINE_FLAG is not configured."; exit 2; }
echo "[+] Monitoring timeline checkpoint passed."
echo "$FLAG"
