#!/usr/bin/env bash
set -euo pipefail

HERE="$(cd "$(dirname "$0")" && pwd)"
BASE="$HOME/cyberclub/scope-challenge"
rm -rf "$BASE"
mkdir -p "$BASE"

cp "$HERE/evidence.txt" "$BASE/evidence.txt"
cp "$HERE/scope-cards.md" "$BASE/scope-cards.md"

FLAG="${BEGINNER_SCOPE_FLAG:-FLAG_NOT_CONFIGURED}"
cat > "$BASE/.authorization-closure" <<EOF
case=scope-review
status=complete
scope_flag=$FLAG
EOF

echo "[+] Scope challenge created at $BASE"
