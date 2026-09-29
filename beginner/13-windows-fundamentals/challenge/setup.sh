#!/usr/bin/env bash
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
BASE="$HOME/cyberclub/windows-fundamentals"
rm -rf "$BASE"
mkdir -p "$BASE"

cp "$HERE/evidence.txt" "$BASE/evidence.txt"

EVIDENCE_FLAG="${BEGINNER_WINDOWS_EVIDENCE_FLAG:-FLAG_NOT_CONFIGURED}"
ANALYSIS_FLAG="${BEGINNER_WINDOWS_ANALYSIS_FLAG:-FLAG_NOT_CONFIGURED}"

cat > "$BASE/process-context.txt" <<EOF
focus=WINWORD.EXE -> powershell.exe
evidence_flag=$EVIDENCE_FLAG
EOF

cat > "$BASE/.task-handoff" <<EOF
focus=InventoryCheck
analysis_flag=$ANALYSIS_FLAG
EOF

echo "[+] Windows case created at $BASE"
