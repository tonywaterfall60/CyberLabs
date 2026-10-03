#!/usr/bin/env bash
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
BASE="$HOME/cyberclub/advanced-cloud-identity"
rm -rf "$BASE"
mkdir -p "$BASE"
for f in identity-map.json trust-policy.json audit-events.jsonl; do cp "$HERE/$f" "$BASE/$f"; done
PATH_FLAG="${ADV_CLOUD_IDENTITY_PATH_FLAG:-FLAG_NOT_CONFIGURED}"
CONTROL_FLAG="${ADV_CLOUD_IDENTITY_CONTROL_FLAG:-FLAG_NOT_CONFIGURED}"
cat > "$BASE/path-note.txt" <<EOF
path=reporting-app->reporting-role->credential-admin->training-service
path_flag=$PATH_FLAG
EOF
cat > "$BASE/.credential-control-review" <<EOF
controls=remove_cross_role_assume,short_lived_credentials,approval,alert_on_access_key_creation
control_flag=$CONTROL_FLAG
EOF
echo "[+] Advanced cloud-identity workspace created at $BASE"
