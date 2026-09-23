#!/usr/bin/env bash
set -e

BASE="$HOME/cyberclub/linux-challenge"
rm -rf "$BASE"
mkdir -p "$BASE/logs" "$BASE/archive" "$BASE/docs"

printf "INFO startup complete\nFAILED_LOGIN user=sam source=192.168.56.50\nINFO user=alex login=success\nFAILED_LOGIN user=sam source=192.168.56.50\n" > "$BASE/logs/auth.log"

printf "normal notes\n" > "$BASE/docs/notes.txt"

if [[ -n "${FLAG_VALUE:-}" ]]; then
  printf "%s\n" "$FLAG_VALUE" > "$BASE/archive/evidence.txt"
else
  printf "FLAG_NOT_CONFIGURED\n" > "$BASE/archive/evidence.txt"
fi

printf "Remember: hidden files begin with a dot.\n" > "$BASE/.hint"

echo "[+] Challenge created at $BASE"
