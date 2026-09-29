#!/usr/bin/env bash
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
BASE="$HOME/cyberclub/ad-intro"
rm -rf "$BASE"
mkdir -p "$BASE"
for f in users.csv groups.csv computers.csv spns.csv; do cp "$HERE/$f" "$BASE/$f"; done
MAP_FLAG="${INTERMEDIATE_AD_MAP_FLAG:-FLAG_NOT_CONFIGURED}"
PRIV_FLAG="${INTERMEDIATE_AD_PRIVILEGE_FLAG:-FLAG_NOT_CONFIGURED}"
cat > "$BASE/identity-map-note.txt" <<EOF
nested_path=alice->Helpdesk->Server Operators
map_flag=$MAP_FLAG
EOF
cat > "$BASE/.privilege-review" <<EOF
privileged_group=Domain Admins
member=carol
privilege_flag=$PRIV_FLAG
EOF
echo "[+] Active Directory intro workspace created at $BASE"
