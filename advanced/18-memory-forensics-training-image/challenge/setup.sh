#!/usr/bin/env bash
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
BASE="$HOME/cyberclub/advanced-memory-forensics"
rm -rf "$BASE"
mkdir -p "$BASE"
cp "$HERE/image-manifest.txt" "$BASE/image-manifest.txt"
cp "$HERE/volatility-summary.txt" "$BASE/volatility-summary.txt"
SEQ_FLAG="${ADV_MEMORY_SEQUENCE_FLAG:-FLAG_NOT_CONFIGURED}"
CONF_FLAG="${ADV_MEMORY_CONFIDENCE_FLAG:-FLAG_NOT_CONFIGURED}"
cat > "$BASE/sequence-note.txt" <<EOF
sequence=WINWORD->powershell->cmd+network+temp_file+RWX_region
sequence_flag=$SEQ_FLAG
EOF
cat > "$BASE/.confidence-review" <<EOF
status=suspicious_requires_disk_edr_log_validation
confidence_flag=$CONF_FLAG
EOF
echo "[+] Advanced memory-forensics workspace created at $BASE"
