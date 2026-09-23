#!/usr/bin/env bash
set -e

BASE="$HOME/cyberclub/forensics-challenge"
rm -rf "$BASE"
mkdir -p "$BASE/evidence"

printf "Meeting moved to 7 PM.\n" > "$BASE/evidence/meeting-notes.txt"
cp "$BASE/evidence/meeting-notes.txt" "$BASE/evidence/working-copy.txt"
printf "This is plain text even though the extension suggests an image.\n" > "$BASE/evidence/photo.jpg"
printf "user=alex action=login status=success\nuser=sam action=login status=failed\n" > "$BASE/evidence/auth.log"

echo "[+] Forensics challenge created at $BASE/evidence"
