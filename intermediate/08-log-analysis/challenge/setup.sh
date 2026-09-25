#!/usr/bin/env bash
set -euo pipefail
BASE="$HOME/cyberclub/log-analysis"
rm -rf "$BASE"
mkdir -p "$BASE"

cat > "$BASE/auth.log" <<'EOF'
2026-09-23T18:00:01Z FAIL user=sam src=10.10.10.50 session=-
2026-09-23T18:00:04Z FAIL user=sam src=10.10.10.50 session=-
2026-09-23T18:00:08Z FAIL user=alex src=10.10.10.50 session=-
2026-09-23T18:00:12Z FAIL user=sam src=10.10.10.50 session=-
2026-09-23T18:00:20Z SUCCESS user=sam src=10.10.10.50 session=S-2201
2026-09-23T18:10:00Z SUCCESS user=lee src=10.10.10.12 session=S-3301
EOF

cat > "$BASE/app.log" <<'EOF'
2026-09-23T18:00:25Z user=sam session=S-2201 action=VIEW_PROFILE result=success
2026-09-23T18:00:31Z user=sam session=S-2201 action=EXPORT_REPORT object=quarterly.csv result=success
2026-09-23T18:00:45Z user=sam session=S-2201 action=DOWNLOAD_FILE object=inventory.csv result=success
2026-09-23T18:01:02Z user=sam session=S-2201 action=LOGOUT result=success
2026-09-23T18:10:05Z user=lee session=S-3301 action=VIEW_PROFILE result=success
EOF

cat > "$BASE/vpn.log" <<'EOF'
2026-09-23T18:00:22Z CONNECT user=sam src=10.10.10.50 session=S-2201 assigned=10.20.0.44
2026-09-23T18:01:05Z DISCONNECT user=sam src=10.10.10.50 session=S-2201 assigned=10.20.0.44
2026-09-23T18:10:02Z CONNECT user=lee src=10.10.10.12 session=S-3301 assigned=10.20.0.12
EOF

cat > "$BASE/host.log" <<'EOF'
2026-09-23T18:00:28Z host=WS-44 user=sam event=PROCESS_START process=browser.exe session=S-2201
2026-09-23T18:00:40Z host=WS-44 user=sam event=FILE_CREATE path=/tmp/quarterly.csv session=S-2201
2026-09-23T18:10:04Z host=WS-12 user=lee event=PROCESS_START process=browser.exe session=S-3301
EOF
echo "[+] Logs created at $BASE"