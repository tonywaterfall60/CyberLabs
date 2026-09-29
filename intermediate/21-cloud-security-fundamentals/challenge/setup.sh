#!/usr/bin/env bash
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
BASE="$HOME/cyberclub/cloud-security"
rm -rf "$BASE"
mkdir -p "$BASE"
cp "$HERE/cloud.json" "$BASE/cloud.json"

CONFIG_FLAG="${INTERMEDIATE_CLOUD_CONFIG_FLAG:-FLAG_NOT_CONFIGURED}"
ACTIVITY_FLAG="${INTERMEDIATE_CLOUD_ACTIVITY_FLAG:-FLAG_NOT_CONFIGURED}"

cat > "$BASE/config-review.txt" <<EOF
iam_issue=iam:CreateAccessKey on *
storage_issue=public_read true and logging false
network_issue=SSH 22 open to 0.0.0.0/0
config_flag=$CONFIG_FLAG
EOF

cat > "$BASE/.audit-review" <<EOF
event=anonymous GetObject quarterly.csv success
activity_flag=$ACTIVITY_FLAG
EOF

echo "[+] Cloud security workspace created at $BASE"
