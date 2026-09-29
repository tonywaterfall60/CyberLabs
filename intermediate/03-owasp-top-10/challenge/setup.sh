#!/usr/bin/env bash
set -euo pipefail

BASE="$HOME/cyberclub/owasp-risk-review"
rm -rf "$BASE"
mkdir -p "$BASE"

CLASSIFY_FLAG="${INTERMEDIATE_OWASP_CLASSIFY_FLAG:-FLAG_NOT_CONFIGURED}"
PRIORITY_FLAG="${INTERMEDIATE_OWASP_PRIORITY_FLAG:-FLAG_NOT_CONFIGURED}"

cat > "$BASE/classification-note.txt" <<EOF
finding_count=10
classification_flag=$CLASSIFY_FLAG
EOF

cat > "$BASE/.priority-closure" <<EOF
task=top-three-remediation
priority_flag=$PRIORITY_FLAG
EOF

echo "[+] OWASP review workspace created at $BASE"
