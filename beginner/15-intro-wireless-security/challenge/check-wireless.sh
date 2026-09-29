#!/usr/bin/env bash
set -euo pipefail
norm(){ printf '%s' "$1" | tr '[:upper:]' '[:lower:]' | xargs; }
ask(){ local p="$1" e="$2" a; read -r -p "$p " a; [[ "$(norm "$a")" == "$(norm "$e")" ]] || { echo "[-] Re-check the wireless evidence and try again."; exit 1; }; }

ask "Protected SSID:" "CyberLabs-Staff"
ask "Open SSID:" "CyberLabs-Guest"
ask "Channel used by CyberLabs-Staff:" "6"
ask "BSSID for CyberLabs-Staff:" "02:11:22:33:44:10"
ask "Client address observed probing/associating:" "02:aa:bb:cc:dd:01"

FLAG="${BEGINNER_WIRELESS_FLAG:-}"
[[ -n "$FLAG" ]] || { echo "[!] Wireless analysis correct, but BEGINNER_WIRELESS_FLAG is not configured."; exit 2; }
echo "[+] Wireless evidence checkpoint passed."
echo "$FLAG"
