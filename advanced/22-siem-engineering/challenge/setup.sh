#!/usr/bin/env bash
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
BASE="$HOME/cyberclub/advanced-siem"
rm -rf "$BASE"
mkdir -p "$BASE"
for f in auth.jsonl endpoint.jsonl proxy.csv schema-change.txt; do cp "$HERE/$f" "$BASE/$f"; done
NORMALIZE_FLAG="${ADV_SIEM_NORMALIZE_FLAG:-FLAG_NOT_CONFIGURED}"
RESILIENCE_FLAG="${ADV_SIEM_RESILIENCE_FLAG:-FLAG_NOT_CONFIGURED}"
cat > "$BASE/normalization-note.txt" <<EOF
schema=timestamp,source,host,user,action,result,src_ip,dst_ip,process
normalize_flag=$NORMALIZE_FLAG
EOF
cat > "$BASE/.schema-drift-review" <<EOF
changed=account->principal_name,device->endpoint_name
resilience_flag=$RESILIENCE_FLAG
EOF
echo "[+] Advanced SIEM workspace created at $BASE"
