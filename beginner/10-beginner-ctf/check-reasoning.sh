#!/usr/bin/env bash
set -euo pipefail
norm(){ printf '%s' "$1" | tr '[:upper:]' '[:lower:]' | xargs; }
ask(){ local p="$1" e="$2" a; read -r -p "$p " a; [[ "$(norm "$a")" == "$(norm "$e")" ]] || { echo "[-] Review Challenge 9 and try again."; exit 1; }; }
ask "Authentication working? (yes/no)" "yes"
ask "Authorization working? (yes/no)" "no"
ask "Primary issue (one word):" "authorization"
FLAG="${BEGINNER_CTF_REASONING_FLAG:-}"
[[ -n "$FLAG" ]] || { echo "[!] Reasoning validated, but BEGINNER_CTF_REASONING_FLAG is not configured."; exit 2; }
echo "[+] CTF security-reasoning checkpoint passed."
echo "$FLAG"
