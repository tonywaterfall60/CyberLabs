#!/usr/bin/env bash
set -euo pipefail
norm(){ printf '%s' "$1" | tr '[:upper:]' '[:lower:]' | xargs; }
ask(){ local p="$1" e="$2" a; read -r -p "$p " a; [[ "$(norm "$a")" == "$(norm "$e")" ]] || { echo "[-] Review the HTTP evidence and try again."; exit 1; }; }
ask "Cookie name:" "training_view"
ask "Response header that sets a cookie:" "set-cookie"
ask "Request header that sends it back:" "cookie"
ask "Admin route status code:" "403"
ask "Does robots.txt enforce authorization? (yes/no)" "no"
FLAG="${BEGINNER_WEB_STATE_FLAG:-}"
[[ -n "$FLAG" ]] || { echo "[!] Answers correct, but BEGINNER_WEB_STATE_FLAG is not configured."; exit 2; }
echo "[+] HTTP state and authorization concepts validated."
echo "$FLAG"
