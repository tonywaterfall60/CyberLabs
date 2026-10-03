#!/usr/bin/env bash
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
BASE="$HOME/cyberclub/advanced-incident-command"
rm -rf "$BASE"
mkdir -p "$BASE"
for f in incident-timeline.jsonl status-board.md roles.md; do cp "$HERE/$f" "$BASE/$f"; done
COMMAND_FLAG="${ADV_IR_COMMAND_FLAG:-FLAG_NOT_CONFIGURED}"
COMM_FLAG="${ADV_IR_COMM_FLAG:-FLAG_NOT_CONFIGURED}"
cat > "$BASE/command-note.txt" <<EOF
focus=roles+timeline+containment_tradeoffs
command_flag=$COMMAND_FLAG
EOF
cat > "$BASE/.communications-review" <<EOF
deliverables=technical_handoff+executive_update
communications_flag=$COMM_FLAG
EOF
echo "[+] Advanced incident-command workspace created at $BASE"
