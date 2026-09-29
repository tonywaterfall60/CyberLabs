#!/usr/bin/env bash
set -euo pipefail
LOG="$HOME/cyberclub/beginner-ctf/logs/auth.log"
[[ -f "$LOG" ]] || { echo "[-] Run ./setup.sh first."; exit 1; }
fails="$(grep -c 'FAILED_LOGIN' "$LOG")"
success="$(grep -c 'LOGIN_SUCCESS' "$LOG")"
top_user="$(grep 'FAILED_LOGIN' "$LOG" | sed -n 's/.*user=\([^ ]*\).*/\1/p' | sort | uniq -c | sort -nr | head -1 | awk '{print $2}')"
top_src="$(grep 'FAILED_LOGIN' "$LOG" | sed -n 's/.*source=\([^ ]*\).*/\1/p' | sort | uniq -c | sort -nr | head -1 | awk '{print $2}')"
[[ "$fails" == "5" && "$success" == "3" && "$top_user" == "sam" && "$top_src" == "192.168.56.50" ]] || { echo "[-] Log-analysis results do not match the CTF evidence."; exit 1; }
FLAG="${BEGINNER_CTF_LOG_FLAG:-}"
[[ -n "$FLAG" ]] || { echo "[!] Logs validated, but BEGINNER_CTF_LOG_FLAG is not configured."; exit 2; }
echo "[+] CTF log-analysis checkpoint passed."
echo "$FLAG"
