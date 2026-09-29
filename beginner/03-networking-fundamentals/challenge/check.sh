#!/usr/bin/env bash
set -euo pipefail

normalize() {
  printf '%s' "$1" | tr '[:upper:]' '[:lower:]' | xargs
}

ask() {
  local prompt="$1"
  local expected="$2"
  local answer
  read -r -p "$prompt " answer
  if [[ "$(normalize "$answer")" != "$(normalize "$expected")" ]]; then
    echo "[-] Not quite. Review the network diagram and try again."
    exit 1
  fi
}

echo "CyberLabs Beginner 03 completion check"
ask "1) If a site works by IP but not hostname, which service should you investigate first?" "dns"
ask "2) Which command displays the default route?" "ip route"
ask "3) Which local command shows listening TCP/UDP sockets?" "ss -tulpn"
ask "4) If ping succeeds but TCP 443 is refused, is basic IP reachability working? (yes/no)" "yes"

FLAG="${BEGINNER_NETWORKING_FLAG:-}"
if [[ -z "$FLAG" ]]; then
  echo "[!] Answers correct, but BEGINNER_NETWORKING_FLAG is not configured."
  echo "[!] Ask the event lead to run the checker with the private event flags loaded."
  exit 2
fi

echo "[+] Networking fundamentals check passed."
echo "$FLAG"
