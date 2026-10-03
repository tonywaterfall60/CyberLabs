#!/usr/bin/env bash
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
BASE="$HOME/cyberclub/advanced-identity-paths"
rm -rf "$BASE"
mkdir -p "$BASE"
cp "$HERE/relationships.csv" "$BASE/relationships.csv"
PATHS_FLAG="${ADV_AD_PATHS_FLAG:-FLAG_NOT_CONFIGURED}"
PRIORITY_FLAG="${ADV_AD_PRIORITY_FLAG:-FLAG_NOT_CONFIGURED}"
cat > "$BASE/paths-note.txt" <<EOF
example=alex->Helpdesk->Web Admins->WEB01
paths_flag=$PATHS_FLAG
EOF
cat > "$BASE/.priority-review" <<EOF
focus=blast_radius_and_privileged_sessions
priority_flag=$PRIORITY_FLAG
EOF
echo "[+] Advanced identity-path workspace created at $BASE"
