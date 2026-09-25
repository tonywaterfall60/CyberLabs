#!/usr/bin/env bash
set -euo pipefail
BASE="$HOME/cyberclub/linux-privesc-audit"
rm -rf "$BASE"
mkdir -p "$BASE/etc" "$BASE/opt/backup" "$BASE/opt/reports" "$BASE/home/appuser" "$BASE/var/www" "$BASE/var/log"

cat > "$BASE/etc/identity.txt" <<'EOF'
user=appuser
uid=1001
groups=appuser,www-data
shell=/bin/bash
EOF

cat > "$BASE/etc/sudoers_excerpt.txt" <<'EOF'
appuser ALL=(root) NOPASSWD: /usr/bin/tar
analyst ALL=(root) /usr/bin/systemctl status nginx
EOF

cat > "$BASE/etc/cron_excerpt.txt" <<'EOF'
* * * * * root /opt/backup/backup.sh
*/5 * * * * root /opt/reports/generate.sh
EOF

cat > "$BASE/opt/backup/backup.sh" <<'EOF'
#!/bin/sh
tar -czf /tmp/site.tgz /var/www
EOF
chmod 777 "$BASE/opt/backup/backup.sh"

cat > "$BASE/opt/reports/generate.sh" <<'EOF'
#!/bin/sh
echo report > /tmp/report.txt
EOF
chmod 755 "$BASE/opt/reports/generate.sh"

cat > "$BASE/home/appuser/config.ini" <<'EOF'
database_user=admin
database_password=training-password
EOF
chmod 644 "$BASE/home/appuser/config.ini"

cat > "$BASE/etc/service_notes.txt" <<'EOF'
Service: backup-agent
RunAs: root
ExecStart=/opt/backup/backup.sh

Service: report-generator
RunAs: root
ExecStart=/opt/reports/generate.sh
EOF

cat > "$BASE/etc/suid_inventory.txt" <<'EOF'
-rwsr-xr-x root root /usr/bin/passwd
-rwsr-xr-x root root /usr/bin/su
-rwsr-xr-x root root /usr/bin/mount
EOF

cat > "$BASE/var/log/audit-notes.txt" <<'EOF'
Training snapshot only.
Not every privileged binary or root-owned service is a vulnerability.
Focus on lower-privileged influence over higher-privileged execution.
EOF

echo "[+] Audit snapshot created at $BASE"