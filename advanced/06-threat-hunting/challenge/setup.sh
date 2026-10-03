#!/usr/bin/env bash
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
BASE="$HOME/cyberclub/advanced-threat-hunt"
rm -rf "$BASE"
mkdir -p "$BASE"
cp "$HERE/events.jsonl" "$BASE/events.jsonl"
SEQUENCE_FLAG="${ADV_HUNT_SEQUENCE_FLAG:-FLAG_NOT_CONFIGURED}"
OUTCOME_FLAG="${ADV_HUNT_OUTCOME_FLAG:-FLAG_NOT_CONFIGURED}"
cat > "$BASE/sequence-note.txt" <<EOF
host=WS-03
sequence=encoded_powershell->dns->network->file->cmd->registry
sequence_flag=$SEQUENCE_FLAG
EOF
cat > "$BASE/.outcome-review" <<EOF
expected_outcome=strongly_suspicious_sequence
outcome_flag=$OUTCOME_FLAG
EOF
echo "[+] Threat-hunt workspace created at $BASE"
