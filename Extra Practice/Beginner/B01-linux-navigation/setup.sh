#!/usr/bin/env bash
set -euo pipefail
BASE="$HOME/cyberclub/extra-beginner-b01"
rm -rf "$BASE"
mkdir -p "$BASE/projects/archive" "$BASE/notes"
printf 'meeting notes\n' > "$BASE/notes/today.txt"
printf 'old project evidence\n' > "$BASE/projects/archive/evidence.txt"
printf 'owner=analyst\nflag=%s\n' "${BEGINNER_EXTRA_B01_FLAG:-FLAG_NOT_CONFIGURED}" > "$BASE/projects/archive/.completion-note"
chmod 640 "$BASE/projects/archive/evidence.txt"
echo "[+] B01 workspace created at $BASE"
