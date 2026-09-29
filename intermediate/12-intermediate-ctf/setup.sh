#!/usr/bin/env bash
set -euo pipefail

SRC="$(cd "$(dirname "$0")" && pwd)"
BASE="$HOME/cyberclub/intermediate-ctf"
rm -rf "$BASE"
mkdir -p "$BASE/logs" "$BASE/linux-audit" "$BASE/crypto" "$BASE/forensics" "$BASE/reversing"

cat > "$BASE/logs/auth.log" <<'EOF'
2026-09-23T20:00:01Z FAIL user=alex src=10.20.30.40 session=-
2026-09-23T20:00:03Z FAIL user=alex src=10.20.30.40 session=-
2026-09-23T20:00:06Z FAIL user=sam src=10.20.30.40 session=-
2026-09-23T20:00:08Z SUCCESS user=alex src=10.20.30.40 session=CTF-S-1
2026-09-23T20:00:15Z user=alex session=CTF-S-1 action=EXPORT_REPORT result=success
2026-09-23T20:00:21Z user=alex session=CTF-S-1 action=DOWNLOAD_FILE object=finance.csv result=success
EOF

cat > "$BASE/logs/vpn.log" <<'EOF'
2026-09-23T20:00:10Z CONNECT user=alex src=10.20.30.40 session=CTF-S-1 assigned=10.30.0.44
2026-09-23T20:01:00Z DISCONNECT user=alex src=10.20.30.40 session=CTF-S-1 assigned=10.30.0.44
EOF

cat > "$BASE/linux-audit/sudoers.txt" <<'EOF'
analyst ALL=(root) NOPASSWD: /usr/bin/tar
viewer ALL=(root) /usr/bin/systemctl status nginx
EOF

cat > "$BASE/linux-audit/cron.txt" <<'EOF'
* * * * * root /opt/reporting/export.sh
EOF

cat > "$BASE/linux-audit/permissions.txt" <<'EOF'
/opt/reporting/export.sh mode=0777 owner=root group=root
/opt/reporting/readme.txt mode=0644 owner=root group=root
EOF

printf 'SW50ZXJtZWRpYXRlIENURjogdmFsaWRhdGUgYmVmb3JlIHlvdSBjb25jbHVkZS4K' > "$BASE/crypto/message.b64"
printf 'Intermediate CTF integrity evidence\n' > "$BASE/crypto/evidence.txt"
(cd "$BASE/crypto" && sha256sum evidence.txt > known.sha256)

printf 'normal report copy\n' > "$BASE/forensics/original.txt"
cp "$BASE/forensics/original.txt" "$BASE/forensics/copy.txt"
printf 'This file is text despite the png extension.\n' > "$BASE/forensics/mystery.png"

NETWORK_FLAG="${INTERMEDIATE_CTF_NETWORK_FLAG:-FLAG_NOT_CONFIGURED}"
LOG_FLAG="${INTERMEDIATE_CTF_LOG_FLAG:-FLAG_NOT_CONFIGURED}"
LINUX_FLAG="${INTERMEDIATE_CTF_LINUX_FLAG:-FLAG_NOT_CONFIGURED}"
EVIDENCE_FLAG="${INTERMEDIATE_CTF_EVIDENCE_FLAG:-FLAG_NOT_CONFIGURED}"
REV_FLAG="${INTERMEDIATE_CTF_REV_FLAG:-FLAG_NOT_CONFIGURED}"

cat > "$BASE/network-note.txt" <<EOF
authorized_range=8400-8499
network_flag=$NETWORK_FLAG
EOF

cat > "$BASE/logs/correlation-note.txt" <<EOF
session=CTF-S-1
log_flag=$LOG_FLAG
EOF

cat > "$BASE/linux-audit/.privilege-review" <<EOF
focus=/opt/reporting/export.sh
linux_flag=$LINUX_FLAG
EOF

printf '%s' "$EVIDENCE_FLAG" | base64 > "$BASE/crypto/evidence-flag.b64"

base64 -d "$SRC/intermediate-validator.b64" | gzip -d > "$BASE/reversing/intermediate-validator"
chmod 755 "$BASE/reversing/intermediate-validator"

cat > "$BASE/reversing/run-validator.sh" <<EOF
#!/usr/bin/env bash
REV_FLAG_VALUE='$REV_FLAG' "$(dirname "$0")/intermediate-validator"
EOF
chmod 755 "$BASE/reversing/run-validator.sh"

echo "[+] Intermediate CTF files created at $BASE"
echo "[+] Web target will be http://127.0.0.1:8440 after docker compose up -d"