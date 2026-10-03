#!/usr/bin/env bash
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
BASE="$HOME/cyberclub/advanced-cloud-security"
rm -rf "$BASE"
mkdir -p "$BASE"
for f in iam-policy.json bucket.json security-groups.json identity-map.json audit-events.jsonl logging.json; do cp "$HERE/$f" "$BASE/$f"; done
PATH_FLAG="${ADV_CLOUD_PATH_FLAG:-FLAG_NOT_CONFIGURED}"
HARDEN_FLAG="${ADV_CLOUD_HARDEN_FLAG:-FLAG_NOT_CONFIGURED}"
cat > "$BASE/abuse-path-note.txt" <<EOF
path=reporting-app->reporting-role->CreateAccessKey(training-service)
observed_public_object_access=true
path_flag=$PATH_FLAG
EOF
cat > "$BASE/.least-privilege-review" <<EOF
remove=iam:CreateAccessKey
scope=s3_reporting_resources_only
hardening_flag=$HARDEN_FLAG
EOF
echo "[+] Advanced cloud-security workspace created at $BASE"
