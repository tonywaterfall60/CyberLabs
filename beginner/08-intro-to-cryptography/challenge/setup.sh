#!/usr/bin/env bash
set -e

BASE="$HOME/cyberclub/crypto-challenge"
rm -rf "$BASE"
mkdir -p "$BASE"

printf "Q3liZXJMYWJzIHNheXM6IGVuY29kaW5nIGlzIG5vdCBlbmNyeXB0aW9uLgo=" > "$BASE/message.b64"
printf "Evidence integrity matters.\n" > "$BASE/original.txt"
cp "$BASE/original.txt" "$BASE/copy.txt"

echo "[+] Crypto challenge created at $BASE"
