#!/usr/bin/env bash
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
BASE="$HOME/cyberclub/advanced-windows-internals"
rm -rf "$BASE"
mkdir -p "$BASE"
cp "$HERE/internals.txt" "$BASE/internals.txt"
INTERNALS_FLAG="${ADV_WINDOWS_INTERNALS_FLAG:-FLAG_NOT_CONFIGURED}"
CONTAIN_FLAG="${ADV_WINDOWS_CONTAINMENT_FLAG:-FLAG_NOT_CONFIGURED}"
cat > "$BASE/correlation-note.txt" <<EOF
lead=WINWORD.EXE->powershell.exe
service=NorthstarUpdater/LocalSystem
internals_flag=$INTERNALS_FLAG
EOF
cat > "$BASE/.containment-review" <<EOF
next_evidence=command_line,network,file,service_binary,edr
containment_flag=$CONTAIN_FLAG
EOF
echo "[+] Advanced Windows internals workspace created at $BASE"
