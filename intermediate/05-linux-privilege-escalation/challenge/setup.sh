#!/usr/bin/env bash
set -e

BASE="$HOME/cyberclub/linux-privesc-audit"
rm -rf "$BASE"
mkdir -p "$BASE/etc" "$BASE/opt/backup" "$BASE/home/appuser" "$BASE/var/www"

cat > "$BASE/etc/sudoers_excerpt.txt" <<'EOF'
appuser ALL=(root) NOPASSWD: /usr/bin/tar
analyst ALL=(root) /usr/bin/systemctl status nginx
EOF

cat > "$BASE/etc/cron_excerpt.txt" <<'EOF'
* * * * * root /opt/backup/backup.sh
EOF

cat > "$BASE/opt/backup/backup.sh" <<'EOF'
#!/bin/sh
tar -czf /tmp/site.tgz /var/www
EOF
chmod 777 "$BASE/opt/backup/backup.sh"

cat > "$BASE/home/appuser/config.ini" <<'EOF'
database_user=admin
database_password=training-password
EOF
chmod 644 "$BASE/home/appuser/config.ini"

cat > "$BASE/etc/service_notes.txt" <<'EOF'
Service runs as root.
ExecStart=/opt/backup/backup.sh
EOF

echo "[+] Audit snapshot created at $BASE"
