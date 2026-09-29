#!/usr/bin/env bash
set -euo pipefail

norm(){ printf '%s' "$1" | tr '[:upper:]' '[:lower:]' | xargs; }
ask(){
  local p="$1" e="$2" a
  read -r -p "$p " a
  if [[ "$(norm "$a")" != "$(norm "$e")" ]]; then
    echo "[-] Not quite. Re-check the packets and try again."
    exit 1
  fi
}

echo "CyberLabs Beginner 05 packet-analysis checkpoint"
ask "Destination TCP port:" "8085"
ask "First request path:" "/"
ask "Second request path:" "/status"
ask "Third request path:" "/help"
ask "Fourth request path:" "/status"
ask "HTTP response code observed for these requests:" "200"

FLAG="${BEGINNER_WIRESHARK_ANALYSIS_FLAG:-}"
if [[ -z "$FLAG" ]]; then
  echo "[!] Correct answers, but BEGINNER_WIRESHARK_ANALYSIS_FLAG is not configured."
  exit 2
fi

echo "[+] Packet timeline reconstructed."
echo "$FLAG"
