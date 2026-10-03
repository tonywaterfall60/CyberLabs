#!/usr/bin/env bash
set -euo pipefail
BASE="$HOME/cyberclub/extra-beginner-b02"
rm -rf "$BASE"
mkdir -p "$BASE"
cat > "$BASE/events.log" <<'EOF'
INFO user=alice action=login
FAIL user=bob action=login
INFO user=carol action=logout
FAIL user=bob action=login
FAIL user=dana action=login
INFO user=alice action=view
EOF
printf 'FILTER_COMPLETE %s\n' "${BEGINNER_EXTRA_B02_FLAG:-FLAG_NOT_CONFIGURED}" >> "$BASE/events.log"
echo "[+] B02 workspace created at $BASE"
