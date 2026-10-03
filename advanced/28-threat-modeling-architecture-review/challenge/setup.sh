#!/usr/bin/env bash
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
BASE="$HOME/cyberclub/advanced-threat-modeling"
rm -rf "$BASE"
mkdir -p "$BASE"
for f in architecture.txt dataflows.csv requirements.md; do cp "$HERE/$f" "$BASE/$f"; done
MODEL_FLAG="${ADV_THREAT_MODEL_FLAG:-FLAG_NOT_CONFIGURED}"
CONTROL_FLAG="${ADV_ARCH_CONTROL_FLAG:-FLAG_NOT_CONFIGURED}"
cat > "$BASE/model-note.txt" <<EOF
focus=assets+actors+trust_boundaries+abuse_cases
model_flag=$MODEL_FLAG
EOF
cat > "$BASE/.architecture-review" <<EOF
priority=object_authorization+service_to_service_auth+auditable_storage_access
control_flag=$CONTROL_FLAG
EOF
echo "[+] Advanced threat-modeling workspace created at $BASE"
