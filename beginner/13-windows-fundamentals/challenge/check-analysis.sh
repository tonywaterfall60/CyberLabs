#!/usr/bin/env bash
set -euo pipefail
norm(){ printf '%s' "$1" | tr '[:upper:]' '[:lower:]' | xargs; }
ask(){ local p="$1" e="$2" a; read -r -p "$p " a; [[ "$(norm "$a")" == "$(norm "$e")" ]] || { echo "[-] Re-check the Windows evidence and try again."; exit 1; }; }

ask "User running WINWORD.EXE:" "training\alex"
ask "Parent process of powershell.exe:" "winword.exe"
ask "Account running InventoryCheck:" "system"
ask "Remote destination port used by powershell.exe:" "443"

FLAG="${BEGINNER_WINDOWS_ANALYSIS_FLAG:-}"
[[ -n "$FLAG" ]] || { echo "[!] Analysis correct, but BEGINNER_WINDOWS_ANALYSIS_FLAG is not configured."; exit 2; }
echo "[+] Windows analysis checkpoint passed."
echo "$FLAG"
