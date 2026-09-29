#!/usr/bin/env bash
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
BASE="$HOME/cyberclub/git-security"
rm -rf "$BASE"
mkdir -p "$BASE"
cp "$HERE/history.txt" "$BASE/history.txt"
cp "$HERE/diff.txt" "$BASE/diff.txt"

EXPOSURE_FLAG="${INTERMEDIATE_GIT_EXPOSURE_FLAG:-FLAG_NOT_CONFIGURED}"
REMEDIATION_FLAG="${INTERMEDIATE_GIT_REMEDIATION_FLAG:-FLAG_NOT_CONFIGURED}"

cat > "$BASE/exposure-note.txt" <<EOF
introduced_in=b2
removed_from_latest_in=c3
exposure_flag=$EXPOSURE_FLAG
EOF

cat > "$BASE/.remediation-order" <<EOF
first=rotate_or_revoke_credential
then=rewrite_history_if_needed
remediation_flag=$REMEDIATION_FLAG
EOF

echo "[+] Git security workspace created at $BASE"
