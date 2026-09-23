#!/usr/bin/env bash
set -e
BASE="$HOME/cyberclub/log-analysis"
rm -rf "$BASE"
mkdir -p "$BASE"
cat > "$BASE/auth.log" <<'EOF'
2026-09-23T18:00:01Z FAIL user=sam src=10.10.10.50
2026-09-23T18:00:04Z FAIL user=sam src=10.10.10.50
2026-09-23T18:00:08Z FAIL user=alex src=10.10.10.50
2026-09-23T18:00:12Z FAIL user=sam src=10.10.10.50
2026-09-23T18:00:20Z SUCCESS user=sam src=10.10.10.50
2026-09-23T18:10:00Z SUCCESS user=lee src=10.10.10.12
EOF
cat > "$BASE/app.log" <<'EOF'
2026-09-23T18:00:25Z user=sam action=VIEW_PROFILE
2026-09-23T18:00:31Z user=sam action=EXPORT_REPORT
2026-09-23T18:01:02Z user=sam action=LOGOUT
2026-09-23T18:10:05Z user=lee action=VIEW_PROFILE
EOF
echo "[+] Logs created at $BASE"
