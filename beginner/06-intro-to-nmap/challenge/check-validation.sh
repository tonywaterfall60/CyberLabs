#!/usr/bin/env bash
set -euo pipefail

norm(){ printf '%s' "$1" | tr '[:upper:]' '[:lower:]' | xargs; }
ask(){
  local p="$1" e="$2" a
  read -r -p "$p " a
  if [[ "$(norm "$a")" != "$(norm "$e")" ]]; then
    echo "[-] Incorrect. Validate the application content with curl or Netcat."
    exit 1
  fi
}

echo "CyberLabs Beginner 06 manual-validation checkpoint"
ask "Port for the Asset Inventory Service:" "8080"
ask "Port for the Service Status Console:" "8088"
ask "Port for the Documentation Service:" "8096"

FLAG="${BEGINNER_NMAP_VALIDATION_FLAG:-}"
if [[ -z "$FLAG" ]]; then
  echo "[!] Roles correct, but BEGINNER_NMAP_VALIDATION_FLAG is not configured."
  exit 2
fi

echo "[+] Manual service validation complete."
echo "$FLAG"
