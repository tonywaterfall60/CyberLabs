#!/usr/bin/env bash
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
BASE="$HOME/cyberclub/advanced-emulation-validation"
rm -rf "$BASE"
mkdir -p "$BASE"
cp "$HERE/emulation-events.jsonl" "$BASE/emulation-events.jsonl"
COVERAGE_FLAG="${ADV_EMULATION_COVERAGE_FLAG:-FLAG_NOT_CONFIGURED}"
GAP_FLAG="${ADV_EMULATION_GAP_FLAG:-FLAG_NOT_CONFIGURED}"
cat > "$BASE/coverage-note.txt" <<EOF
steps=5
telemetry=process,dns,network,file
coverage_flag=$COVERAGE_FLAG
EOF
cat > "$BASE/.visibility-review" <<EOF
gap=identify_missing_sensor_or_logging_source
visibility_flag=$GAP_FLAG
EOF
echo "[+] Advanced emulation-validation workspace created at $BASE"
