#!/usr/bin/env bash
set -euo pipefail
norm(){ printf '%s' "$1" | tr '[:upper:]' '[:lower:]' | xargs; }
ask(){ local p="$1" e="$2" a; read -r -p "$p " a; [[ "$(norm "$a")" == "$(norm "$e")" ]] || { echo "[-] Re-check the scope cards and try again."; exit 1; }; }

echo "CyberLabs Beginner 12 scope checkpoint"
ask "Is 192.0.2.44 authorized? (yes/no)" "no"
ask "Is 172.28.50.0/28 authorized? (yes/no)" "yes"
ask "Can Card C originals be modified? (yes/no)" "no"
ask "Does Card D allow deauthentication? (yes/no)" "no"
ask "If a target is outside the stated scope, should you continue testing? (yes/no)" "no"

FLAG="${BEGINNER_SCOPE_FLAG:-}"
[[ -n "$FLAG" ]] || { echo "[!] Scope answers correct, but BEGINNER_SCOPE_FLAG is not configured."; exit 2; }
echo "[+] Scope and authorization checkpoint passed."
echo "$FLAG"
