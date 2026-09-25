#!/usr/bin/env bash
set -euo pipefail

BASE="$HOME/cyberclub/extra-practice/linux-incident"
FLAG_VALUE="${FLAG_VALUE:-FLAG_NOT_CONFIGURED}"

rm -rf "$BASE"
mkdir -p "$BASE"/{logs,evidence,config}

cat > "$BASE/case-info.txt" <<'EOF'
Case: EP-01 Linux Incident Investigation
System: training-web-01
Environment: synthetic local evidence
Scope: this directory only
EOF

cat > "$BASE/logs/auth.log" <<'EOF'
2026-09-24T18:40:03Z FAIL user=sam src=10.20.30.44 method=password
2026-09-24T18:40:07Z FAIL user=sam src=10.20.30.44 method=password
2026-09-24T18:40:12Z FAIL user=alex src=10.20.30.44 method=password
2026-09-24T18:40:18Z FAIL user=sam src=10.20.30.44 method=password
2026-09-24T18:40:31Z FAIL user=sam src=10.20.30.44 method=password
2026-09-24T18:41:02Z SUCCESS user=sam src=10.20.30.44 method=password
2026-09-24T18:43:10Z SUCCESS user=alex src=10.20.30.21 method=key
EOF

cat > "$BASE/logs/app.log" <<'EOF'
2026-09-24T18:41:10Z user=sam action=VIEW_PROFILE result=success
2026-09-24T18:41:22Z user=sam action=EXPORT_REPORT result=success object=quarterly-access.csv
2026-09-24T18:41:48Z user=sam action=DOWNLOAD_FILE result=success object=inventory.csv
2026-09-24T18:42:15Z user=sam action=LOGOUT result=success
2026-09-24T18:44:02Z user=alex action=VIEW_PROFILE result=success
EOF

cat > "$BASE/evidence/updater.sh" <<'EOF'
#!/usr/bin/env bash
# Training-only artifact. Do not execute during the exercise.
TARGET="/tmp/.training-cache"
echo "maintenance check" > "$TARGET"
EOF
chmod 775 "$BASE/evidence/updater.sh"

cat > "$BASE/evidence/note.txt" <<EOF
Incident analyst note
Flag: $FLAG_VALUE
EOF

cat > "$BASE/config/app.conf" <<'EOF'
environment=training
database_host=db.training.local
database_user=reporting_app
database_password=training-password
log_level=info
EOF

touch -t 202609241842 "$BASE/evidence/updater.sh"
touch -t 202609241839 "$BASE/config/app.conf"

echo "[+] Extra Practice Linux incident lab created at:"
echo "    $BASE"
echo "[+] Read README.md before investigating."
