#!/usr/bin/env bash
set -euo pipefail

normalize() {
  printf '%s' "$1" | tr '[:upper:]' '[:lower:]' | xargs
}

check_answer() {
  local label="$1"
  local expected="$2"
  local answer
  read -r -p "$label " answer
  if [[ "$(normalize "$answer")" != "$(normalize "$expected")" ]]; then
    echo "[-] Incorrect. Re-run your Linux commands and try again."
    exit 1
  fi
}

BASE="$HOME/cyberclub/linux-challenge"
if [[ ! -d "$BASE" ]]; then
  echo "[-] Challenge directory not found. Run ./setup.sh first."
  exit 1
fi

echo "CyberLabs Beginner 02 completion check"
check_answer "Failed-login count:" "3"
check_answer "Suspicious username:" "sam"
check_answer "Suspicious source IP:" "192.168.56.50"
check_answer "Relative evidence path from the challenge root:" "archive/2026-09/evidence.txt"

FLAG="${BEGINNER_LINUX_COMPLETE_FLAG:-}"
if [[ -z "$FLAG" ]]; then
  echo "[!] Answers correct, but BEGINNER_LINUX_COMPLETE_FLAG is not configured."
  echo "[!] Ask the event lead to run the checker with the private event flags loaded."
  exit 2
fi

echo "[+] Completion check passed."
echo "$FLAG"
