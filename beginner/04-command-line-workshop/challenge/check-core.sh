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
    echo "[-] Incorrect. Rebuild your pipeline and try again."
    exit 1
  fi
}

BASE="$HOME/cyberclub/cli-challenge"
[[ -f "$BASE/auth.log" ]] || { echo "[-] Run ./setup.sh first."; exit 1; }

echo "CyberLabs Beginner 04 analysis checkpoint"
ask "Failed-login count:" "6"
ask "Successful-login count:" "3"
ask "Most targeted username:" "sam"
ask "Most common failed source IP:" "192.168.56.50"

FLAG="${BEGINNER_CLI_ANALYSIS_FLAG:-}"
if [[ -z "$FLAG" ]]; then
  echo "[!] Answers correct, but BEGINNER_CLI_ANALYSIS_FLAG is not configured."
  exit 2
fi

echo "[+] Analysis checkpoint passed."
echo "$FLAG"
