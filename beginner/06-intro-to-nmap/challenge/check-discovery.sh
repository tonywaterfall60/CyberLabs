#!/usr/bin/env bash
set -euo pipefail

normalize_ports() {
  printf '%s' "$1" | tr ',' '
' | xargs -n1 | sort -n | paste -sd, -
}

read -r -p "Enter all open TCP ports, comma-separated: " answer

if [[ "$(normalize_ports "$answer")" != "8080,8088,8096" ]]; then
  echo "[-] Port list does not match the challenge environment."
  echo "    Re-run your scoped Nmap scan and try again."
  exit 1
fi

FLAG="${BEGINNER_NMAP_DISCOVERY_FLAG:-}"
if [[ -z "$FLAG" ]]; then
  echo "[!] Discovery correct, but BEGINNER_NMAP_DISCOVERY_FLAG is not configured."
  exit 2
fi

echo "[+] All challenge services discovered."
echo "$FLAG"
