#!/usr/bin/env bash
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
BASE="$HOME/cyberclub/http-deep-dive"
rm -rf "$BASE"
mkdir -p "$BASE"

cp "$HERE/http-transcript.txt" "$BASE/http-transcript.txt"

BEHAVIOR_FLAG="${INTERMEDIATE_HTTP_BEHAVIOR_FLAG:-FLAG_NOT_CONFIGURED}"
SECURITY_FLAG="${INTERMEDIATE_HTTP_SECURITY_FLAG:-FLAG_NOT_CONFIGURED}"

cat > "$BASE/behavior-note.txt" <<EOF
focus=method_status_cookie_cache_redirect
behavior_flag=$BEHAVIOR_FLAG
EOF

cat > "$BASE/.security-boundary-note" <<EOF
focus=cors_vs_authorization
security_flag=$SECURITY_FLAG
EOF

echo "[+] HTTP deep-dive workspace created at $BASE"
