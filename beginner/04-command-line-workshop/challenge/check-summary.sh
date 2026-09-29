#!/usr/bin/env bash
set -euo pipefail

BASE="$HOME/cyberclub/cli-challenge"
SUMMARY="$BASE/summary.txt"

if [[ ! -f "$SUMMARY" ]]; then
  echo "[-] summary.txt was not found in $BASE"
  exit 1
fi

required=(
  "Failed login count: 6"
  "Successful login count: 3"
  "Most targeted user: sam"
  "Most common failed source: 192.168.56.50"
)

for line in "${required[@]}"; do
  if ! grep -Fqx "$line" "$SUMMARY"; then
    echo "[-] Missing or incorrect summary line:"
    echo "    $line"
    exit 1
  fi
done

for file in failed.txt failed-count.txt failed-sources.txt; do
  if [[ ! -s "$BASE/$file" ]]; then
    echo "[-] Required evidence file missing or empty: $file"
    exit 1
  fi
done

FLAG="${BEGINNER_CLI_SUMMARY_FLAG:-}"
if [[ -z "$FLAG" ]]; then
  echo "[!] Files are correct, but BEGINNER_CLI_SUMMARY_FLAG is not configured."
  exit 2
fi

echo "[+] Evidence files and summary validated."
echo "$FLAG"
