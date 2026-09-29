#!/usr/bin/env bash
set -euo pipefail
norm(){ printf '%s' "$1" | tr '[:upper:]' '[:lower:]' | xargs; }
ask(){ local p="$1" e="$2" a; read -r -p "$p " a; [[ "$(norm "$a")" == "$(norm "$e")" ]] || { echo "[-] Review the prep material and try again."; exit 1; }; }

echo "CyberLabs Beginner readiness checkpoint"
ask "Tool to resolve a hostname:" "dig"
ask "Tool to inspect HTTP headers:" "curl"
ask "Tool to identify actual file type:" "file"
ask "Before scanning a system, what must you confirm? (one word)" "scope"
ask "A logged-in user reading another user's report is primarily an authentication or authorization problem?" "authorization"

FLAG="${BEGINNER_CAPSTONE_READY_FLAG:-}"
[[ -n "$FLAG" ]] || { echo "[!] Readiness check passed, but BEGINNER_CAPSTONE_READY_FLAG is not configured."; exit 2; }
echo "[+] Beginner readiness checkpoint passed."
echo "$FLAG"
