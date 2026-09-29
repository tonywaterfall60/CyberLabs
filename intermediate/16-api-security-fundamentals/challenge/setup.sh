#!/usr/bin/env bash
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
BASE="$HOME/cyberclub/api-security"
rm -rf "$BASE"
mkdir -p "$BASE"
cp "$HERE/api-transcript.txt" "$BASE/api-transcript.txt"
MAP_FLAG="${INTERMEDIATE_API_MAP_FLAG:-FLAG_NOT_CONFIGURED}"
AUTHZ_FLAG="${INTERMEDIATE_API_AUTHZ_FLAG:-FLAG_NOT_CONFIGURED}"
cat > "$BASE/endpoint-map-note.txt" <<EOF
routes=status,me,notes
map_flag=$MAP_FLAG
EOF
cat > "$BASE/.authorization-review" <<EOF
finding=cross_user_note_access
authz_flag=$AUTHZ_FLAG
EOF
echo "[+] API security workspace created at $BASE"
