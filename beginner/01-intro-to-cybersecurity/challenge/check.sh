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
    echo "[-] Not quite. Review the challenge material and try again."
    exit 1
  fi
}

echo "CyberLabs Beginner 01 completion check"
echo "Answer using the requested word or short phrase."

ask "1) Which CIA property is most directly affected when backups cannot be restored? (confidentiality/integrity/availability)" "availability"
ask "2) A logged-in normal user can directly access an admin-only page. Which control failed? (authentication/authorization)" "authorization"
ask "3) Reusing one password across unrelated services is primarily a password ____ problem." "reuse"

FLAG="${BEGINNER_INTRO_FLAG:-}"
if [[ -z "$FLAG" ]]; then
  echo "[!] Answers correct, but BEGINNER_INTRO_FLAG is not configured."
  echo "[!] Ask the event lead to run the checker with the private event flag loaded."
  exit 2
fi

echo "[+] Completion check passed."
echo "$FLAG"
