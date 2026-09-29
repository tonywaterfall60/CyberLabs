#!/usr/bin/env bash
set -euo pipefail
norm(){ printf '%s' "$1" | tr '[:upper:]' '[:lower:]' | xargs; }
ask(){ local p="$1" e="$2" a; read -r -p "$p " a; [[ "$(norm "$a")" == "$(norm "$e")" ]] || { echo "[-] Review the correlated sequence and try again."; exit 1; }; }

ask "How many auth failures occur before success?" "2"
ask "Does one isolated auth failure alone prove compromise? (yes/no)" "no"
ask "Which telemetry type records powershell.exe launch?" "process"
ask "Which telemetry type records the outbound connection?" "network"

FLAG="${BEGINNER_MONITORING_DETECTION_FLAG:-}"
[[ -n "$FLAG" ]] || { echo "[!] Detection reasoning correct, but BEGINNER_MONITORING_DETECTION_FLAG is not configured."; exit 2; }
echo "[+] Detection/correlation checkpoint passed."
echo "$FLAG"
