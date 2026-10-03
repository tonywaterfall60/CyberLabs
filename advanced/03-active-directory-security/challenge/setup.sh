#!/usr/bin/env bash
set -euo pipefail
HERE="$(cd "$(dirname "$0")" && pwd)"
BASE="$HOME/cyberclub/advanced-ad-security"
rm -rf "$BASE"
mkdir -p "$BASE"

for f in users.csv groups.csv memberships.csv spns.csv delegation.csv computers.csv local-admin.csv sessions.csv password-policy.txt; do
  cp "$HERE/$f" "$BASE/$f"
done

PATH_FLAG="${ADV_AD_PATH_FLAG:-FLAG_NOT_CONFIGURED}"
DEFENSE_FLAG="${ADV_AD_DEFENSE_FLAG:-FLAG_NOT_CONFIGURED}"

cat > "$BASE/attack-path-note.txt" <<EOF
path=alice->Helpdesk->Server Operators->backup01
path_flag=$PATH_FLAG
EOF

cat > "$BASE/.defense-review" <<EOF
priority=reduce_nested_privilege_and_delegated_admin_exposure
defense_flag=$DEFENSE_FLAG
EOF

echo "[+] Advanced AD workspace created at $BASE"
